#include "database.hpp"

#include <QSqlQuery>
#include <QVariant>
#include <QString>
#include <QVector>
#include <QStringRef>
#include <QSqlError>

Database::Database(QObject *parent) :QObject(parent) {
    m_handle = QSqlDatabase::addDatabase("QSQLITE", "db");
    m_handle.setDatabaseName("cookbook");
    m_handle.open();
    initializeTables();
}

int Database::addRecipe(const QString &name, int categoryId, const QString &ingredientsRaw, const QString &body) {
    QSqlQuery query(m_handle);
    query.prepare("INSERT INTO recipes(category_id, name, body) VALUES(?, ?, ?)");
    query.addBindValue(categoryId);
    query.addBindValue(name);
    query.addBindValue(body);
    query.exec();
    int recipeId = query.lastInsertId().toInt();
    auto ingredients = ingredientsRaw.splitRef(',');
    for (const auto &item : ingredients) {
        auto parts = item.split('-');
        auto ingredient = parts[0].trimmed();
        auto amount = parts[1].trimmed();
        int ingredientId = findOrInsertIngredient(ingredient.toString());
        attachIngredientToRecipe(recipeId, ingredientId, amount.toString());
    }
    emit recipeAdded(recipeId);
    return recipeId;
}

int Database::findOrInsertIngredient(const QString &name) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id FROM ingredients WHERE name = ?");
    query.addBindValue(name);
    query.exec();
    while (query.next()) {
        int id = query.value(0).toInt();
        return id;
    }
    query.prepare("INSERT INTO ingredients(name) VALUES(?)");
    query.addBindValue(name);
    query.exec();
    return query.lastInsertId().toInt();
}

bool Database::attachIngredientToRecipe(int recipeId, int ingredientId, const QString &amount) {
    QSqlQuery query(m_handle);
    query.prepare("INSERT INTO ingredients_recipes(ingredient_id, recipe_id, amount) VALUES(?, ?, ?)");
    query.addBindValue(ingredientId);
    query.addBindValue(recipeId);
    query.addBindValue(amount);
    return query.exec();
}

int Database::addCategory(const QString &name) {
    QSqlQuery query(m_handle);
    query.prepare("INSERT INTO categories(name) VALUES(?)");
    query.addBindValue(name);
    query.exec();
    int categoryId = query.lastInsertId().toInt();
    emit categoryAdded(categoryId);
    return categoryId;
}

std::unordered_map<int, QString> Database::fetchCategoriesAsMap() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM categories");
    std::unordered_map<int, QString> categories = {{0, "<uncategorized>"}};
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        categories.insert({id, name});
    }
    return categories;
}

std::unordered_map<int, QString> Database::fetchIngredientsAsMap() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM ingredients");
    std::unordered_map<int, QString> ingredients;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        ingredients.insert({id, name});
    }
    return ingredients;
}

QVariantList Database::unpackRecipes(QSqlQuery &query) {
    auto categories = fetchCategoriesAsMap();
    QVariantList recipes;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        int categoryId = query.value(2).toInt();
        QVariantMap recipe;
        recipe.insert("id", id);
        recipe.insert("name", name);
        recipe.insert("category_id", categoryId);
        recipe.insert("category_name", categories[categoryId]);
        recipes.append(recipe);
    }
    return recipes;
}

QVariantList Database::fetchRecipes() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name, category_id FROM recipes ORDER BY name ASC");
    return unpackRecipes(query);
}

QVariantList Database::fetchRecipesByCategory(int categoryId) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, category_id FROM recipes WHERE category_id = ? ORDER BY name ASC");
    query.addBindValue(categoryId);
    query.exec();
    return unpackRecipes(query);
}

QVariantList Database::fetchRecipesByIngredient(int ingredientId) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT recipe_id FROM ingredients_recipes WHERE ingredient_id = ?");
    query.addBindValue(ingredientId);
    query.exec();
    QVariantList recipes;
    while (query.next()) {
        int recipeId = query.value(0).toInt();
        recipes.append(fetchRecipeSnippet(recipeId));
    }
    return recipes;
}

QVariantList Database::fetchCategories() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM categories ORDER BY name ASC");
    QVariantList categories;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        QVariantMap category;
        category.insert("id", id);
        category.insert("name", name);
        categories.append(category);
    }
    return categories;
}

QVariantList Database::fetchIngredients() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM ingredients ORDER BY name ASC");
    QVariantList ingredients;
    while (query.next()) {
        int id = query.value(0).toInt();
        QSqlQuery subQuery(m_handle);
        subQuery.prepare("SELECT COUNT(*) FROM ingredients_recipes WHERE ingredient_id = ?");
        subQuery.addBindValue(id);
        subQuery.exec();
        if (subQuery.next()) {
            int count = query.value(0).toInt();
            if (count < 1) {
                QSqlQuery subSubQuery(m_handle);
                subSubQuery.prepare("DELETE FROM ingredients WHERE id = ?");
                subSubQuery.addBindValue(id);
                subSubQuery.exec();
                break;
            }
        }
        QString name = query.value(1).toString();
        QVariantMap ingredient;
        ingredient.insert("id", id);
        ingredient.insert("name", name);
        ingredients.append(ingredient);
    }
    return ingredients;
}

QVariantMap Database::fetchRecipe(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, body, category_id FROM recipes WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap recipe;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        QString body = query.value(2).toString();
        int categoryId = query.value(3).toInt();
        recipe.insert("name", name);
        recipe.insert("body", body);
        recipe.insert("ingredients", fetchIngredientsForRecipe(id));
        recipe.insert("category_id", categoryId);
        recipe.insert("category_name", fetchCategoryName(categoryId));
    }
    return recipe;
}

QString Database::fetchCategoryName(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT name FROM categories WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    while (query.next()) {
        QString name = query.value(0).toString();
        return name;
    }
    return "<uncategorized>";
}

QVariantList Database::fetchIngredientsForRecipe(int recipeId) {
    auto allIngredients = fetchIngredientsAsMap();
    QSqlQuery query(m_handle);
    query.prepare("SELECT ingredient_id, amount FROM ingredients_recipes WHERE recipe_id = ?");
    query.addBindValue(recipeId);
    query.exec();
    QVariantList ingredients;
    while (query.next()) {
        int ingredientId = query.value(0).toInt();
        QString amount = query.value(1).toString();
        QVariantMap ingredient;
        ingredient.insert("name", allIngredients[ingredientId]);
        ingredient.insert("amount", amount);
        ingredients.append(ingredient);
    }
    return ingredients;
}

QVariantMap Database::fetchRecipeSnippet(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, category_id FROM recipes WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap recipe;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        int categoryId = query.value(2).toInt();
        recipe.insert("id", id);
        recipe.insert("name", name);
        recipe.insert("category_id", categoryId);
        recipe.insert("category_name", fetchCategoryName(categoryId));
    }
    return recipe;
}

QVariantMap Database::fetchCategory(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name FROM categories WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap category;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        category.insert("id", id);
        category.insert("name", name);
    }
    return category;
}

QVariantMap Database::fetchIngredient(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name FROM ingredients WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap ingredient;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        ingredient.insert("id", id);
        ingredient.insert("name", name);
    }
    return ingredient;
}

void Database::dropDatabase() {
    QSqlQuery query(m_handle);
    query.exec("DROP TABLE recipes");
    query.exec("DROP TABLE categories");
    query.exec("DROP TABLE ingredients");
    query.exec("DROP TABLE ingredients_recipes");
    initializeTables();
}

void Database::initializeTables() {
    QSqlQuery query(m_handle);
    query.exec("CREATE TABLE IF NOT EXISTS recipes(id INTEGER PRIMARY KEY AUTOINCREMENT, category_id INTEGER NOT NULL, name VARCHAR(100) NOT NULL, body TEXT NOT NULL)");
    query.exec("CREATE TABLE IF NOT EXISTS categories(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100) NOT NULL)");
    query.exec("CREATE TABLE IF NOT EXISTS ingredients(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100) NOT NULL)");
    query.exec("CREATE TABLE IF NOT EXISTS ingredients_recipes(ingredient_id INTEGER NOT NULL, recipe_id INTEGER NOT NULL, amount VARCHAR(100) NOT NULL)");
}

bool Database::deleteRecipe(int id) {
    bool ok = true;
    QSqlQuery query(m_handle);
    query.prepare("DELETE FROM recipes WHERE id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    query.prepare("DELETE FROM ingredients_recipes WHERE recipe_id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    return ok;
}

bool Database::deleteCategory(int id) {
    bool ok = true;
    QSqlQuery query(m_handle);
    query.prepare("DELETE FROM categories WHERE id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    query.prepare("UPDATE recipes SET category_id = 0 WHERE category_id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    return ok;
}

QVariantList Database::fetchRecipesByQuery(const QString &searchQuery) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, category_id FROM recipes WHERE name LIKE ? ORDER BY name ASC");
    query.addBindValue("%" + searchQuery + "%");
    query.exec();
    return unpackRecipes(query);
}
