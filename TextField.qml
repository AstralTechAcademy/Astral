import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs
import QtQuick.Controls 2.14

Rectangle{
    id: rect
    height: 50
    width: 250
    radius: 5

    property bool outlined: false
    property alias text_: textInput.text
    property string lineColor_: "blue"
    property string textColor_: lineColor_
    property string backgroundColor_: "lightgray"
    property string fontFamily_: "Calibri"
    
    color: outlined ? "transparent" : backgroundColor_

    border.color: outlined ? lineColor_ : "transparent" 

    signal accepted(var text)

    Rectangle
    {
        id: line
        width: 5
        visible: !outlined
        height: rect.height
        anchors.left: rect.left
        anchors.leftMargin: 1
        radius: rect.radius - 5
        color: lineColor_
    }

    Text {
       id: oldValue
       text : ""
       font.family: fontFamily_
       color: textColor_
       anchors.top: parent.top
       anchors.topMargin: 5
       anchors.left: parent.left
       anchors.leftMargin: 10

    }

    TextInput{
        id: textInput
        anchors.fill: parent
        anchors.top: oldValue.bottom
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: textColor_
        font.family: fontFamily_
        verticalAlignment: TextInput.AlignVCenter
        mouseSelectionMode: TextInput.SelectCharacters
        selectByMouse: true
        onAccepted: {
            textInput.focus = false
            ma.focus = true
            rect.accepted(textInput.text)
        }

    }

    MouseArea
    {
        id: ma
        anchors.fill: rect
        onClicked: {
            oldValue.text = text_
            textColor_ = "black"
            text_ = ""
            ma.visible = false
            textInput.focus = true
        }
    }

    states: [
        State{
            name: "Default"
            PropertyChanges {
                target:  rect;
                border.color: lineColor_
            }
        },
        State{
            name: "Error"
            PropertyChanges {
                target:  rect;
                border.color: "red"
            }
            PropertyChanges {
                target:  line;
                lineColor_: "red"
            }
        }
    ]

}
