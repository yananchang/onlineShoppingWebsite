package com.bjsxt.shopping.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.bjsxt.shopping.Product;
import com.bjsxt.shopping.ProductMgr;

public class ProductListTag extends SimpleTagSupport {

	@Override
	public void doTag() throws JspException, IOException {
		List<Product> list = ProductMgr.getInstance().getProducts();
		for(int i =0; i<list.size(); i++){
			this.getJspContext().getOut().write(list.get(i).getName() + "<br>");
		}
	}

}
