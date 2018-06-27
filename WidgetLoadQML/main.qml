import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
Item{
    id:m_window
    property var sourceImageFiles: [1,2,3,4,5,6,7,8]
    function addListModel()   //添加模型
    {
        for(var i=0;i<sourceImageFiles.length;i++)
        {
            var imageFile=sourceImageFiles[i]
            imageFile='image/'+imageFile+'.jpg'
            m_model.append({"sourceImage":imageFile})
        }
    }
    visible: true
    width: 640
    height: 480
    ListModel{
        id:m_model
    }
    Component{
        id:m_delegate
        Item {
            id:m_wrapper
            width: m_cirView.width
            height: m_cirView.height
            Image {
                anchors.fill: parent
                source: sourceImage
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.openUrlExternally(sourceImage)
            }
        }
    }
    MyCirleView {
        id: m_cirView
        anchors.fill:parent
        model: m_model
        delegate: m_delegate
        onDraggingChanged:dragging?m_timer.stop():m_timer.start()
    }
    PageIndicator {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        count: m_cirView.count
        currentIndex: m_cirView.currentIndex
    }
    Timer {
        id: m_timer
        running: true
        repeat: true
        interval: 4000
        onTriggered: m_cirView.currentIndex = (m_cirView.currentIndex + 1) % m_cirView.count
    }
    Component.onCompleted: {m_window.addListModel()}
}
