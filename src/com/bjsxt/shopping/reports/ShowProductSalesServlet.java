package com.bjsxt.shopping.reports;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.bjsxt.shopping.SalesOrder;
import com.bjsxt.shopping.User;
import com.bjsxt.shopping.util.DB;

public class ShowProductSalesServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShowProductSalesServlet() {
		super();
	}

	private DefaultCategoryDataset categoryDataset = new DefaultCategoryDataset();
	private DefaultPieDataset pieDataset = new DefaultPieDataset();
	
	
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	private void getDataSet() { 
        
        Connection conn = null;
		ResultSet rs = null;
		int pageCount = 0;
		try {
			conn = DB.getConn();
			String sql = "select p.name, sum(pcount) from product p join salesitem si on (p.id = si.productid) group by p.id";
System.out.println(sql);
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				categoryDataset.addValue(rs.getInt(2), "", rs.getString(1));
				pieDataset.setValue(rs.getString(1), rs.getInt(2));
			}
		} catch (SQLException e) {
				e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
        
        
    } 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDataSet(); 
        JFreeChart chartCategory = ChartFactory.createBarChart3D( 
                           "Sales Quantity", // 图表标题
                           "Product", // 目录轴的显示标签
                           "Sales", // 数值轴的显示标签
                            categoryDataset, // 数据集
                            PlotOrientation.VERTICAL, // 图表方向：水平、垂直
                            true,  // 是否显示图例(对于简单的柱状图必须是 false)
                            false, // 是否生成工具
                            false  // 是否生成 URL 链接
                            ); 
        
        JFreeChart pieChart = ChartFactory.createPieChart3D("Sales Product", 
       		 pieDataset, 
       		 true, 
       		 false, 
       		 false 
       		 );   //1st argument, chart title, has to be in English, no output if it's Chinese
                           
        FileOutputStream category_jpg = null; 
        FileOutputStream pie_jpg = null; 

        try { 
            category_jpg = new FileOutputStream("C:\\eclipse\\workspace\\Shopping\\WebRoot\\images\\reports\\productsales.jpg"); 
            ChartUtilities.writeChartAsJPEG(category_jpg,1.0f,chartCategory,400,300,null); 
            
            pie_jpg = new FileOutputStream("C:\\eclipse\\workspace\\Shopping\\WebRoot\\images\\reports\\productsales_pie.jpg"); 
            ChartUtilities.writeChartAsJPEG(pie_jpg,1.0f,pieChart,400,300,null); 
            
            this.getServletContext().getRequestDispatcher("/admin/showproductsaleschart.jsp").forward(request, response);
            //ChartUtilities.writeChartAsJPEG(out, quality, chart, width, height);
        } finally { 
            try { 
                category_jpg.close(); 
                pie_jpg.close();
            } catch (Exception e) {} 
        } 
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
