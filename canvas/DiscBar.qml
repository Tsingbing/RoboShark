import QtQuick 2.0

Rectangle{
    id: contair
    width: rad * 2
    height: rad * 2
    color: "#000000FF"
    //opacity: 1
    radius: 360
    rotation: 270
    property var rad: 50
    property var value: 0
    property var maxValue: 100
    onValueChanged: canvas.requestPaint()
    Text {
        font.pixelSize: 36
        font.family: "微软雅黑"
        anchors.centerIn: parent
        color:"#fafafa"
        rotation: 90
        text: Math.round(value / maxValue * 100) + "%"
    }
    Canvas{
        id: canvas
        anchors.fill: parent
        contextType: "2d"
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 10
            ctx.strokeStyle = "#54f23a"
            ctx.beginPath();
            ctx.arc(rad,rad,rad - 5,0,Math.PI/180 * ((value / maxValue) * 360),false);
            ctx.stroke();
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked:
            NumberAnimation {
            target: contair
            property: "value"
            to:maxValue
            easing.type: Easing.OutQuart
            duration: 2000
            onStopped: console.log(contair.value)
        }
    }
}
