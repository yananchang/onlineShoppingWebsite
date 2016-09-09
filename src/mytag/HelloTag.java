package mytag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HelloTag extends SimpleTagSupport {

	@Override
	public void doTag() throws JspException, IOException {
		this.getJspContext().getOut().write("HelloWorld!");
	}

}
