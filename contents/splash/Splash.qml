import QtQuick
import QtQuick.Window

Rectangle {
    id: root
    color: "#000000"
    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        } 
        
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
        }

        Rectangle {
            id: imageContainer
            anchors.fill: parent
            color: "transparent"

            AnimatedImage {
                id: gifAnim
                source: "images/splash.gif"
                paused: false
                
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                
                smooth: true
                visible: true
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000 
        easing.type: Easing.InOutQuad
    }
}