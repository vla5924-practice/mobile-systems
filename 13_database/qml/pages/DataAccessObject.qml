import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {
    property var database

    Component.onCompleted: {
        database = LocalStorage.openDatabaseSync("notes", "1.0");
        database.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)");
        });
    }

    function insertNote(name) {
        database.transaction(function(tx) {
           var result = tx.executeSql("INSERT INTO notes(name) VALUES(?)", [name]);
        });
    }

    function deleteNote(id) {
        database.transaction(function (tx) {
            tx.executeSql("DELETE FROM notes WHERE id = ?", [id]);
        });
    }

    function fetchNotes(callback) {
        database.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM notes");
            callback(result.rows);
        });
    }
}
