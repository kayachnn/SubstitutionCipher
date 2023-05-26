import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: customButton
    property alias buttonText: customButton.text
    signal clicked()

    onClicked: {
        clicked()
    }
}
