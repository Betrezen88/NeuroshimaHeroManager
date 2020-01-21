#ifndef DIFFICULTY_H
#define DIFFICULTY_H

#include <QObject>

class Difficulty : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString fullName READ fullName CONSTANT)
    Q_PROPERTY(QString shortName READ shortName CONSTANT)
    Q_PROPERTY(int value READ value CONSTANT)
public:
    Difficulty(QObject *parent = nullptr): QObject(parent) {}
    Difficulty(const QString &fullName,
               const QString &shortName,
               const int &value,
               QObject *parent = nullptr)
        : QObject(parent),
          m_full(fullName),
          m_short(shortName),
          m_value(value)
    {}

    QString fullName() const { return m_full; }
    QString shortName() const { return m_short; }
    int value() const { return m_value; }

private:
    QString m_full;
    QString m_short;
    int m_value{0};
};

#endif // DIFFICULTY_H
