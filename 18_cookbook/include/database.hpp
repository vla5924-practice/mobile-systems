#ifndef DATABASE_HPP
#define DATABASE_HPP

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>
#include <unordered_map>

class Database : public QObject {
    Q_OBJECT

protected:
    QSqlDatabase m_handle;

    void initializeTables();
    int findOrInsertIngredient(const QString &name);
    bool attachIngredientToRecipe(int recipeId, int ingredientId, const QString &amount);
    std::unordered_map<int, QString> fetchCategoriesAsMap();
    QString fetchCategoryName(int id);
    std::unordered_map<int, QString> fetchIngredientsAsMap();
    QVariantList fetchIngredientsForRecipe(int recipeId);
    QVariantList unpackRecipes(QSqlQuery &query);

public:
    explicit Database(QObject *parent = nullptr);
    ~Database() = default;

    Q_INVOKABLE int addRecipe(const QString &name, int categoryId, const QString &ingredientsRaw, const QString &body);
    Q_INVOKABLE int addCategory(const QString &name);
    Q_INVOKABLE QVariantList fetchRecipes();
    Q_INVOKABLE QVariantList fetchRecipesByCategory(int categoryId);
    Q_INVOKABLE QVariantList fetchRecipesByIngredient(int ingredientId);
    Q_INVOKABLE QVariantList fetchRecipesByQuery(const QString &searchQuery);
    Q_INVOKABLE QVariantList fetchCategories();
    Q_INVOKABLE QVariantList fetchIngredients();
    Q_INVOKABLE QVariantMap fetchRecipe(int id);
    Q_INVOKABLE QVariantMap fetchRecipeSnippet(int id);
    Q_INVOKABLE QVariantMap fetchCategory(int id);
    Q_INVOKABLE QVariantMap fetchIngredient(int id);
    Q_INVOKABLE void dropDatabase();
    Q_INVOKABLE bool deleteRecipe(int id);
    Q_INVOKABLE bool deleteCategory(int id);

signals:
    void recipeAdded(int recipeId);
    void categoryAdded(int categoryId);
};

#endif // DATABASE_HPP
