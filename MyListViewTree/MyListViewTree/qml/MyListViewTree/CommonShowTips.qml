import QtQuick 2.0
import QtQuick.Controls 1.0

Rectangle {
    id: rectId
    width: 600
    height: 400
    color: "#b8e1fc"
    radius: 10
    border.width: 1.2
    //border.color: "#affafa"

    property string contentInfo : "text"
    property real imageSize: 140//224//140
    property real textContentHeight: rectId.height
    property real textContentRightMargin: 20
    property string imageSource:"configmenu/images/excalmatoryMark1.png"

    property int pageSelect : 0 //qml GoTo Base Arguments Page

    //property alias skipLabel : textSkipId.text

    property var chooseTipsFun : null

    signal errorConfirm()
    signal mouselimitAppear()
    signal mouselimitDisappear()
    signal clkeyboardDisappear()

    Flickable
    {
        id: flick
        anchors.fill: parent
        //可拖拽内容大小
        contentWidth: text_TextAreaId.width+textContentRightMargin
        contentHeight: text_TextAreaId.height
        //隐藏大于显示窗口的部分
        clip: true;
        Text{
            id: text_TextAreaId
//            anchors.topMargin: parent.radius
//            anchors.bottomMargin: parent.radius
//            anchors.rightMargin: parent.radius
//            anchors.leftMargin: parent.radius
            x: 5
            y: 5
            width: rectId.width-textContentRightMargin
            height: rectId.height+text_TextAreaId.contentHeight;
            //focus: true  //show cursor position -》显示闪烁光标
            text: contentInfo
            wrapMode: TextEdit.WrapAnywhere  //换行
            clip:true
            font.pixelSize: 18
            textFormat: TextEdit.TopRight
            font.wordSpacing : 3
            lineHeight : 1.10
            //readOnly: true
            //backgroundVisible:false
        }
    }

    //竖滚动条
    Rectangle
    {
        id: scrollbar_vertical
        anchors.right: flick.right
        anchors.rightMargin: 0
        radius: 10
        border.width: 1.2
        //当前可视区域的位置.为百分比值,0-1之间
        y: flick.visibleArea.yPosition * flick.height
        width: 8
        //当前可视区域的高度比例,为百分比值,0-1之间
        height: flick.visibleArea.heightRatio * flick.height
        color: "#b8e1fc"
        //隐藏大于显示窗口的部分
        clip: true;
    }

    function textLength() {
        return text_TextAreaId.contentHeight;
   }

   Component.onCompleted: {
       console.log(textLength())
   }


//    Rectangle {
//            id: scrollRect
//            width: 300; height: 40;
//            anchors{top: parent.top; topMargin: 50;}
//            radius: 4; color: "transparent"
//            Text {
//                id: scrollText
//                height: parent.height
//                color: "red"
//                font.bold: true
//                font.pixelSize: 20
//                verticalAlignment: Text.AlignVCenter
//                text: qsTr("This reference guide describes the features of the QML language. Many of the QML types in the guide originate from the Qt QML or Qt Quick modules.")
//            }

//            SequentialAnimation on x {
//                loops: Animation.Infinite
//                PropertyAnimation {
//                    from: scrollRect.width
//                    to: -scrollText.width
//                    duration: 8000
//                }
//            }
//        }

    /*
    ListView {
         id: list_view
         anchors.fill: parent
         anchors.margins: 10
         clip: true
         model: 1        //16个model
         delegate:    Rectangle {
             id:rectId1
                   anchors.fill: parent      //代理
        //            border.color: 'grey'

                    Text{
                        id: text_TextAreaId
                        anchors.topMargin: parent.radius
                        anchors.bottomMargin: parent.radius
                        anchors.rightMargin: parent.radius
                        anchors.leftMargin: parent.radius
                        anchors.fill: parent;
                        //focus: true  //show cursor position -》显示闪烁光标
                        text: contentInfo
                        wrapMode: TextEdit.WrapAnywhere  //换行
                        clip:true
                        font.pixelSize: 18
                        textFormat: TextEdit.AutoText
                        //readOnly: true
                        //backgroundVisible:false
                    }
           }
         spacing: 6

     }
*/


//    MouseArea {
//        id: mousearea1
//        anchors.fill: parent
//        onClicked: {
//            rectId.visible=false
//            mouselimitDisappear()
//            errorConfirm()
//            //imageSource="configmenu/images/excalmatoryMark1.png"
//        }
//    }
/*
    Rectangle{
        id:cancelBtnId
        width: parent.width
        height: 40//76
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        visible: true
        color:"#647c8d"
        radius: 10
        border.width: 1.3
        Text {
            id : textSkipId
            text:"skip"
            font.pointSize: 10//16
            //anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            id: mousearea2
            x: 0
            y: 0
            width: 478
            height: 76
            anchors.fill: parent
            onClicked: {
                mouselimitDisappear();
                rectId.visible=false;
                if(chooseTipsFun)
                {
                    chooseTipsFun();
                }
            }
        }
    }
*/
    states: [
        State {
            name: "shrink";when:visible
            //StateChangeScript {script : mouselimitAppear(),clkeyboardDisappear()}
        }
    ]
}

