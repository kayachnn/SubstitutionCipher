import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import QtCharts 2.3
import app.substitution 1.0



Window {
    width: 800
    height: 640
    visible: true
    title: qsTr("Cipher")
    id: mainWindow
    color: "#808080"


    ListModel {
        id: characterFrequencyModel
    }

    Component {
        id: characterFrequencyDelegate

        Item {
            width: parent.width
            height: 50

            Row {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: model.character
                    font.pixelSize: 24
                }

                Text {
                    text: model.frequency
                    font.pixelSize: 24
                }
            }
        }
    }




    ColumnLayout{
        spacing: 1
        width: parent.width
        height: parent.height
        //Layout.fillHeight: true
        ////Layout.fillWidth: true
        anchors.fill: parent

        //ust taraf
        Rectangle {
            width: parent.width
            Layout.preferredHeight: parent.height/6
            border.color: "black"
            border.width: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "gray"
            //Layout.fillHeight: false
            //Layout.fillWidth: true


            Text {
                id: mesajSifrele
                anchors.centerIn: parent
                text: qsTr("Mesaj Sifrele Çöz")
                font.pointSize: 24


            }
        }
        ////////



        //orta taraf
        Rectangle{
            id: rectangle
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height*4/6
            width: parent.width
            color: "gray"
            border.color: "black"
            border.width: 2


            ColumnLayout{
                //Layout.fillHeight: true
                //Layout.fillWidth: true
                height: parent.height
                width: parent.width
                spacing: 1

                //orta tarafon ust rowu
                RowLayout{
                    width: parent.width
                    Layout.preferredHeight: parent.height*4/5
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    spacing: 0


                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "gainsboro"
                        width: parent.width/3
                        Layout.preferredHeight: parent.height
                        border.color: "black"
                        border.width: 2
                        clip: true

                        TextInput{
                            id: sifreleInputText1
                            width: parent.width
                            height: parent.height
                            //Layout.fillHeight: true
                            //Layout.fillWidth: true
                            color: "black"
                            cursorVisible: true
                            font.pointSize: 24
                            wrapMode: TextInput.Wrap
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "gainsboro"
                        width: parent.width / 3
                        Layout.preferredHeight: parent.height
                        border.color: "black"
                        border.width: 2
                        clip: true



                        TextInput{
                            id: sifreleInputText2
                            width: parent.width
                            height: parent.height
                            //Layout.fillHeight: true
                            //Layout.fillWidth: true
                            color: "black"
                            cursorVisible: true
                            font.pointSize: 24
                            wrapMode: TextInput.Wrap
                        }
                    }

                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        color: "gainsboro"
                        width: parent.width/3
                        Layout.preferredHeight:  parent.height
                        border.color: "black"
                        border.width: 2
                        clip: true

                        ////////////
                        ListView {

                            id: characterFrequencyList
                            anchors.fill: parent
                            model: characterFrequencyModel
                            delegate: characterFrequencyDelegate
                        }

                        ///////////
                    }

                }


                //orta tarafın alt rowu
                RowLayout{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth:  parent.width
                    Layout.preferredHeight:  parent.height/5

                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Layout.preferredWidth:   parent.width / 3
                        border.color: "black"
                        border.width: 0
                        color: "gainsboro"

                        RowLayout{
                            ColumnLayout{
                                Label{
                                    text: "k parametresi"
                                    color: "black"
                                }
                                ComboBox{

                                    function createList(){
                                        var arr = [];
                                        for (var i= 1; i<=29; i++){
                                            arr.push(i)
                                        }
                                        return arr
                                    }
                                    id: kParameter
                                    currentIndex: 0
                                    model: createList()

                                }

                            }

                            ///////////
                            /////////////
                            ColumnLayout{
                                Label{
                                    text: "Dil"
                                    color: "black"
                                }
                                ComboBox{
                                    id: dil
                                    currentIndex: 0
                                    model:["Türkçe", "İngilizce"]
                                }
                            }

                            ///////////
                            Button{
                                text: "Sifrele"
                                //                                background: Rectangle{
                                //                                    color: "black"

                                //                                }

                                onClicked: {
                                    console.log("sifrele")
                                    sifreleInputText2.clear()
                                    if (sifreleInputText1.text === ""){
                                        emptyInputWarning.open()
                                        return
                                    }
                                    console.log("dil current value: " +  dil.currentValue)
                                    if (dil.currentIndex === 0) {  //turkce
                                        var cipherText = substitutionCpp.turkishCipher(sifreleInputText1.text, kParameter.currentValue)
                                        console.log("input text: " + sifreleInputText1.text)
                                        console.log("cipher text: ", cipherText)
                                        sifreleInputText2.text = cipherText

                                        updateCharacterFrequencies(cipherText)

                                        substitutionCpp.analyzeTextTurkish(cipherText)
                                        //substitutionCpp.createTurkishTable()




                                    }

                                    else if(dil.currentIndex === 1){  // ingilizce
                                        cipherText = substitutionCpp.englishCipher(sifreleInputText1.text, kParameter.currentValue)
                                        console.log("input text: " + sifreleInputText1.text)
                                        console.log("cipher text: ", cipherText)
                                        sifreleInputText2.text = cipherText

                                    }
                                }

                            }
                            //////////
                        }

                    }

                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Layout.preferredWidth:  parent.width / 3
                        border.color: "black"
                        border.width: 2
                        color: "gainsboro"

                        RowLayout{
                            Button{
                                id:sifreCoz
                                text: "Sifre Coz"
                                onClicked: {
                                    if (sifreleInputText2.text === ""){
                                        emptyInputWarning2.open()
                                        return
                                    }


                                }
                            }

                            Button{
                                id: harfAnaliz
                                text: "Harf Analizi Yap"
                                onClicked: {
                                    if (sifreleInputText2.text === ""){
                                        emptyInputWarning2.open()
                                        return
                                    }
                                    updateCharacterFrequencies(sifreleInputText2.text)

                                }
                            }
                        }


                    }

                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Layout.preferredWidth:  parent.width / 3
                        border.color: "black"
                        border.width: 2
                        color: "gainsboro"
                    }

                    //////////////

                    //////////////


                    /////////

                    //////7


                    ////////////

                }
            }


        }


        //alt kısım
        Rectangle{
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight:  parent.height/6
            border.color: "black"
            border.width: 1
            color: "gray"
        }


    }

    Dialog{
        id: emptyInputWarning
        title: "Hata"
        x: (mainWindow.width - emptyInputWarning.width) / 2
        y: (mainWindow.height - emptyInputWarning.height) / 2
        standardButtons: Dialog.Ok
        Label{
            text: "Şifrele kısmı boş olamaz"
        }
    }

    Dialog{
        id: emptyInputWarning2
        title: "Hata"
        x: (mainWindow.width - emptyInputWarning.width) / 2
        y: (mainWindow.height - emptyInputWarning.height) / 2
        standardButtons: Dialog.Ok
        Label{
            text: "Şifre Çöz  kısmı boş olamaz"
        }
    }

    function updateCharacterFrequencies(text) {
        // Clear the existing data in the model
        characterFrequencyModel.clear();

        // Calculate character frequencies
        var frequencyMap = {};
        for (var i = 0; i < text.length; i++) {
            var character = text.charAt(i);
            if (character === ' '){
                continue
            }

            if (frequencyMap.hasOwnProperty(character)) {
                frequencyMap[character]++;
            } else {
                frequencyMap[character] = 1;
            }
        }

        // Update the model with the new frequencies
        for (var character in frequencyMap) {
            characterFrequencyModel.append({"character": character, "frequency": frequencyMap[character]});
        }
    }

}

/*##^##
Designer {
    D{i:0}D{i:14;invisible:true}D{i:13;invisible:true}
}
##^##*/
