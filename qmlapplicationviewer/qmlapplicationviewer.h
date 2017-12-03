#ifndef QMLAPPLICATIONVIEWER_H
#define QMLAPPLICATIONVIEWER_H

#include <QQuickView>
class QmlApplicationViewer : public QQuickView
{
public:
    explicit QmlApplicationViewer(QWindow *parent = 0);
    virtual ~QmlApplicationViewer();

    void setMainQmlFile(const QString &file);
    void addImportPath(const QString &path);
    void loadDummyDataFiles(const QString &path);
    void show();

private:
    class QmlApplicationViewerPrivate *m_d;
};

#endif // QMLAPPLICATIONVIEWER_H
