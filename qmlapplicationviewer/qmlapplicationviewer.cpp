#include "qmlapplicationviewer.h"

#include <QtCore/QCoreApplication>
#include <QtCore/QDir>
#include <QtCore/QFileInfo>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlContext>
#include <QDebug>

class QmlApplicationViewerPrivate
{
    QString mainQmlFile;
    friend class QmlApplicationViewer;
    static QString adjustPath(const QString &path);
};

QString QmlApplicationViewerPrivate::adjustPath(const QString &path)
{
#ifdef Q_OS_UNIX
#ifdef Q_OS_MAC
    if (!QDir::isAbsolutePath(path))
        return QCoreApplication::applicationDirPath()
                + QLatin1String("/../Resources/") + path;
#else
    const QString pathInShareDir = QCoreApplication::applicationDirPath()
        + QLatin1String("/../share/")
        + QFileInfo(QCoreApplication::applicationFilePath()).fileName()
        + QLatin1Char('/') + path;
    if (QFileInfo(pathInShareDir).exists())
        return pathInShareDir;
#endif
#endif
    return path;
}

QmlApplicationViewer::QmlApplicationViewer(QWindow *parent) :
    QQuickView(parent),
    m_d(new QmlApplicationViewerPrivate)
{
    connect(engine(), SIGNAL(quit()), QCoreApplication::instance(), SLOT(quit()));
    setResizeMode(QQuickView::SizeRootObjectToView);
}

QmlApplicationViewer::~QmlApplicationViewer()
{
    delete m_d;
}

void QmlApplicationViewer::setMainQmlFile(const QString &file)
{
    m_d->mainQmlFile = QmlApplicationViewerPrivate::adjustPath(file);
    setSource(QUrl::fromLocalFile(m_d->mainQmlFile));
}

void QmlApplicationViewer::addImportPath(const QString &path)
{
    engine()->addImportPath(QmlApplicationViewerPrivate::adjustPath(path));
}

void QmlApplicationViewer::loadDummyDataFiles(const QString &path)
{

    QDir dir(QmlApplicationViewerPrivate::adjustPath(path), "*.qml");
    QStringList list = dir.entryList();
    for (int i = 0; i < list.size(); ++i) {
        QString qml = list.at(i);
        QQmlComponent comp(engine(), dir.filePath(qml));
        QObject *dummyData = comp.create();

        if (comp.isError()) {
                qWarning("Error when loading dummydata");
        }

        if (dummyData) {
            qml.truncate(qml.length()-4);
            engine()->rootContext()->setContextProperty(qml, dummyData);
            dummyData->setParent(this);
        }
    }
}

void QmlApplicationViewer::show()
{
    QQuickView::show();
}
