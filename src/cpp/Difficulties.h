#ifndef DIFFICULTIES_H
#define DIFFICULTIES_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Difficulty.h"

class Difficulties : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Difficulty> difficulties READ difficulties NOTIFY difficultiesChanged)
public:
    explicit Difficulties(QObject *parent = nullptr);

    QQmlListProperty<Difficulty> difficulties();
    void appendDifficulty(Difficulty*);
    int difficultiesCount() const;
    Difficulty *difficulty(int) const;
    void clearDifficulties();

signals:
    void difficultiesChanged();

public slots:
    Q_INVOKABLE void loadDifficulties(const QString &filePath);

private:
    static void appendDifficulty(QQmlListProperty<Difficulty>*, Difficulty*);
    static int difficultiesCount(QQmlListProperty<Difficulty>*);
    static Difficulty *difficulty(QQmlListProperty<Difficulty>*, int);
    static void clearDifficulties(QQmlListProperty<Difficulty>*);

private:
    QVector<Difficulty*> m_difficulties;
};

#endif // DIFFICULTIES_H
