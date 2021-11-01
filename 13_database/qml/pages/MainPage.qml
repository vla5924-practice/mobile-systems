import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    DataAccessObject { id: dao }
    ListModel { id: notesListModel }
    Column {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10
        TextField {
            id: field
            placeholderText: "Enter note here..."
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add"
            onClicked: {
                if (!field.text)
                    return;
                dao.insertNote(field.text);
                updateNotes();
            }
        }
        SilicaListView {
            width: parent.width
            height: parent.height
            model: notesListModel
            spacing: 15
            delegate: Button {
                width: parent.width
                onClicked: { dao.deleteNote(model.id); updateNotes(); }
                text: model.name
                height: 80
            }
        }
    }

    function updateNotes() {
        notesListModel.clear();
        dao.fetchNotes(function(notes) {
            for (var i = 0; i < notes.length; i++) {
                var note = notes.item(i);
                notesListModel.append({id: note.id, name: note.name});
            }
        });
    }

    Component.onCompleted: updateNotes()
}
