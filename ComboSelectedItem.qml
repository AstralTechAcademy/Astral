import QtQuick 2.12

Rectangle
{
    id: comboSelectedItem
    height: 20
    width: name.width + 30
    color: "grey"

    Text
    {
        id: name
        text: "Any"
        anchors.left: parent.left
        anchors.leftMargin:3
        anchors.verticalCenter: parent.verticalCenter
    }

    Image
    {
        id: cross
        width: 10
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/assets/error-black"

        MouseArea {
            anchors.fill: parent
            onClicked: console.log("Cross")
        }
    }
}