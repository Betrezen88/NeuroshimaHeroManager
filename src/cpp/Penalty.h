#ifndef PENALTY_H
#define PENALTY_H

#include <QObject>

class Penalty: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString type READ type CONSTANT)
    Q_PROPERTY(int value READ value CONSTANT)
public:
    Penalty(QObject *parent = nullptr): QObject(parent) {}
    Penalty(const QString &name,
            const QString &type,
            const int value,
            QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_type(type),
          m_value(value)
    {}

    QString name() const { return m_name; }
    QString type() const { return m_type; }
    int value() const { return m_value; }

private:
    QString m_name;
    QString m_type;
    int m_value;
};

#endif // PENALTY_H
