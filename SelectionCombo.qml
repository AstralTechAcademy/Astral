import QtQuick 2.12

Item {
    FontLoader { id: robotoFont; source: "../Resources/Fonts/Roboto/Roboto-Regular.ttf"}
    id: containedButton
    height: 60
    width:  200
    property bool outlined: false 
    property string backgroundColor: "lightgrey"
    property string buttonText: "Button"
    property string textColor: outlined ? backgroundColor : "white"
    property string icon: ""
    property string iconColor: textColor

    signal clicked()

    Text
    {
        id: category

        text: "Asset type"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    Rectangle {
        id: rectangle
        color: outlined ? "transparent" : backgroundColor
        radius: 5

        anchors.top: category.bottom
        anchors.topMargin: 3
        anchors.left: category.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        border.width: outlined ? 2 : 0
        border.color:  outlined ? backgroundColor : "transparent"


        Image
        {
            id: open
            width: 20
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/assets/error-black"

            MouseArea {
                anchors.fill: parent
                onClicked: lista.visible = !lista.visible
            }
        }

        Row
        {
            id: itemsSelected
            anchors.verticalCenter: rectangle.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: open.left
            anchors.rightMargin: 3

            height:  20
            z:3
            spacing: 3
            clip: true

            AComboSelectedItem
            {
                id: comboItem
                radius: 5
            }

            AComboSelectedItem
            {
                id: comboItem2
                radius: 5
            }


            AComboSelectedItem
            {
                id: comboItem3
                radius: 5
            }

            AComboSelectedItem
            {
                id: comboItem4
                radius: 5
            }
        }
    }


    Rectangle
    {
        id: lista
        height: 300
        width: rectangle.width
        anchors.top: rectangle.bottom
        anchors.topMargin: 0
        color: "lightgrey"
        visible: false
    }


}
