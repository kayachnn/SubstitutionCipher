import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

//import QtCharts 2.3
import app.blockCipher 1.0
import "components"



Window {
    width: 800
    height: 640
    visible: true
    title: qsTr("Proje 1")
    id: mainWindow
    color: "#808080"



    ColumnLayout{
        spacing: 1
        width: parent.width
        height: parent.height
        anchors.fill: parent


        //ust taraf
        UpperLayout{
            Layout.preferredHeight: parent.height/8
        }

        ////////
        MiddleLayout{
            id: middleLayout
            Layout.preferredHeight: parent.height*3/8
            plainText: "hello"

        }

        GenerateKeyLayout{
            Layout.preferredHeight: parent.height/8
        }

        LowerLayout{
            id: lowerLayout
            Layout.preferredHeight: parent.height/8
            onClicked: {
                console.log("clickedddd")
            }
        }


    }

    Dialog{
        id: emptyInputWarning
        title: "Hata"
        x: (mainWindow.width - emptyInputWarning.width) / 2
        y: (mainWindow.height - emptyInputWarning.height) / 2
        standardButtons: Dialog.Ok
        Label{
            text: "Plain Text kısmı boş olamaz"
        }
    }

    Dialog{
        id: emptyInputWarning2
        title: "Hata"
        x: (mainWindow.width - emptyInputWarning.width) / 2
        y: (mainWindow.height - emptyInputWarning.height) / 2
        standardButtons: Dialog.Ok
        Label{
            text: "Cipher Text  kısmı boş olamaz"
        }
    }



}
