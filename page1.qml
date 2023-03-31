import QtQuick 2.0

Rectangle {
    color: "black"
    Text {
        id: page1
        text: qsTr("Şifreleme Yap")
    }

    TextInput{
        id: page1TextInput
        text: "Şifrelenecek metni yazın"
        anchors.centerIn: parent
    }

}
