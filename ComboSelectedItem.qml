import QtQuick 2.12

Rectangle
{
    id: superparent
    height: 20
    width: name.width + 30
    color: "grey"

    property string itemName: "Any"

    signal removed(var name)

    Text
    {
        id: name
        text: itemName
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
            onClicked: {
                superparent.removed(itemName)
            }
        }
    }
}