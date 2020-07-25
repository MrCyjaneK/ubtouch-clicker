import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.0 as Database
import "../scripts/LoadPage.js" as LoadPage

Page {
    id: homeroot
    anchors.fill: parent

    header: PageHeader {
        id: header
        title: i18n.tr('Shop')
    }
    Label {
        id: dogeamt
        anchors.top: header.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: doge + ' ' + i18n.tr('Dogecoin')
    }
    Button {
        id: catbuybtn
        anchors.top: dogeamt.bottom
        color: if (doge >= 100) { UbuntuColors.green } else { UbuntuColors.red }
        text: i18n.tr('Buy Cat [1 click/second] cost: 100 Dogecoin') + " | " + item_cat + " " + i18n.tr('Cats')
        width: parent.width
        onClicked: {
            if (doge < 100) {
                console.log(i18n.tr("You can't but Cat! You don't have enough money"))
                return
            }
            doge = doge-100;
            item_cat++
        }
    }
    Button {
        id: goback
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        color: UbuntuColors.ash
        width: parent.width
        text: i18n.tr('Go Back')
        onClicked: {
            LoadPage.load('Home')
        }
    }
}
