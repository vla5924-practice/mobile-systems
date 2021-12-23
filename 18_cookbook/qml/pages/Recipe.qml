import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    property int recipeId

    id: page

    Column {
        anchors.fill: parent
        PageHeader {
            id: header
            title: ""
        }
        Text {
            id: recipeIngredients
            text: ""
            color: Theme.primaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Text {
            id: recipeBody
            text: ""
            color: Theme.primaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Component.onCompleted: {
            var recipe = Database.fetchRecipe(page.recipeId);
            header.title = recipe.name;
            header.description = recipe.category_name;
            recipeBody.text = recipe.body;
            var ingredientsRaw = "<ul>"
            recipe.ingredients.forEach(function(item) {
                ingredientsRaw += "<li>" + item.name + " - " + item.amount + "</li>\n";
            });
            ingredientsRaw += "</ul>"
            recipeIngredients.text = ingredientsRaw;
        }
    }
}
