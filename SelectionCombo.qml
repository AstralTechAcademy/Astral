import QtQuick 2.12
import QtQuick.Controls 2.14

Item {
    FontLoader { id: robotoFont; source: "../Resources/Fonts/Roboto/Roboto-Regular.ttf"}
    id: superparent
    height: 60
    width:  200
    property bool outlined: false 
    property string backgroundColor: "lightgrey"
    property string buttonText: "Button"
    property string textColor: outlined ? backgroundColor : "white"
    property string icon: ""
    property string iconColor: textColor
    property var model: ListModel {
            ListElement { name: "Element 1"}
            ListElement { name: "Element 2"}
            ListElement { name: "Element 3"}
    }

    signal clicked(var name)

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


    ScrollView
    {
        id: lista
        width: rectangle.width
        anchors.top: rectangle.bottom
        anchors.topMargin: 3
        height: itemHeight * maxItemDisplayed
        visible: false
        clip: true
        
        property int itemHeight : 35
        property int maxItemDisplayed : 5
        
        Column
        {
            id: items
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5

            Repeater
            {
                id: repeater
                model:  superparent.model
                delegate: 
                    Rectangle
                    {
                        id: item
                        visible: true
                        color: "lightgrey"
                        width: lista.width
                        height: lista.itemHeight

                        required property string name

                        Text
                        {
                            id: itemName
                            text: name
                            anchors.left: parent.left
                            anchors.leftMargin: 5 
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: superparent.clicked(name)
                            onEntered: item.color = "grey"
                            onExited: item.color = "lightgrey"
                        }
                    }
            }
        }
    }
}
