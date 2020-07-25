function load(page) {
    var path = "../pages/%1.qml".arg(page)
    var p = Qt.resolvedUrl(path)
    mainStack.push(p)
}
