import QtQuick 2.15
import QtQuick.Layouts 2.15

Rectangle {
    Layout.fillHeight: true
    Layout.fillWidth: true
    color: "gainsboro"
    width: parent.width / 3
    Layout.preferredHeight: parent.height
    border.color: "black"
    border.width: 2
    clip: true
    property alias text: cipher.text



    TextInput{
        id: cipher
        width: parent.width
        height: parent.height
        //Layout.fillHeight: true
        //Layout.fillWidth: true
        color: "black"
        cursorVisible: true
        font.pointSize: 24
        wrapMode: TextInput.Wrap
        padding: 10
    }
}
