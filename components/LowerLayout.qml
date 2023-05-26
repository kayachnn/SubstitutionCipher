import QtQuick 2.15
import QtQuick.Layouts 2.15

//lower layout
Rectangle{
    Layout.fillHeight: true
    Layout.fillWidth: true
    height: parent.height
    width: parent.width
    color: "gray"

    signal clicked()

    RowLayout{
        Layout.fillWidth: true
        Layout.fillHeight: true
        height:  parent.height
        width: parent.width


        /////////////
        SelectLanguage{
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/10
        }

        ///////////
        SifreleButton{
            id: sifreleButton
            buttonText: "Sifrele"
            onClicked: {
                clicked()
            }
        }

        ///////
        Rectangle{
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/10
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            border.width: 2
            color: "gainsboro"
            Layout.margins: 5
        }


    }

}
