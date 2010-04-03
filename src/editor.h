#ifdef _QCODE_EDIT_
#include <qeditor.h>
class Editor : public QEditor
#else
#include <QTextEdit>
class Editor : public QTextEdit
#endif
{
public:
#ifdef _QCODE_EDIT_
	Editor(QWidget *parent) : QEditor(parent) {}
	QString toPlainText() const { return text(); }
	void setPlainText(const QString& text) { setText(text); }  
#else
	Editor(QWidget *parent) : QTextEdit(parent) {}
	void setLineWrapping(bool on) { if(on) setWordWrapMode(QTextOption::WrapAnywhere); }
	void setContentModified(bool y) { document()->setModified(y); }
	bool isContentModified() { return document()->isModified(); }
	void indentSelection();
	void unindentSelection();
	void commentSelection();
	void uncommentSelection();
#endif
};
