package com.dinero.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.dinero.model.CartBean;
import com.dinero.model.CartItemBean;
import com.dinero.model.CouponBean;
import com.dinero.model.DiscountType;
import com.dinero.model.OrderStatus;

public class CartExcelExporter<E> {
	
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<E> list;
	
	//intitalize
	public CartExcelExporter(List<E> list) {
		this.list = list;
		workbook = new XSSFWorkbook();
	}
	
	private void writeHeaderLine() {
		//不確定
		
		if(list.get(0) instanceof CartBean) {
			sheet = workbook.createSheet("orders");
			
			Row row = sheet.createRow(0);
			CellStyle style = workbook.createCellStyle();
			XSSFFont font = workbook.createFont();
			font.setBold(true);
			font.setFontHeight(16);
			style.setFont(font);
			
	        createCell(row, 0, "訂單編號", style);      
	        createCell(row, 1, "顧客編號", style);       
	        createCell(row, 2, "訂單總額", style);    
	        createCell(row, 3, "交易日期", style);
	        createCell(row, 4, "訂單狀態", style);
	        createCell(row, 5, "發貨日期", style);
		}
		
		if(list.get(0) instanceof CartItemBean) {
			sheet = workbook.createSheet("orderItems");
			
			Row row = sheet.createRow(0);
			CellStyle style = workbook.createCellStyle();
			XSSFFont font = workbook.createFont();
			font.setBold(true);
			font.setFontHeight(16);
			style.setFont(font);
			
	        createCell(row, 0, "購物車編號", style);      
	        createCell(row, 1, "商品編號", style);       
	        createCell(row, 2, "價格", style);    
	        createCell(row, 3, "數量", style);
	        createCell(row, 4, "品項總額", style);
		}
		
		if(list.get(0) instanceof CouponBean) {
			sheet = workbook.createSheet("coupons");
			
			Row row = sheet.createRow(0);
			CellStyle style = workbook.createCellStyle();
			XSSFFont font = workbook.createFont();
			font.setBold(true);
			font.setFontHeight(16);
			style.setFont(font);
			
	        createCell(row, 0, "優惠券id", style);      
	        createCell(row, 1, "優惠券名稱", style);       
	        createCell(row, 2, "折扣類型", style);    
	        createCell(row, 3, "折扣目標", style);
	        createCell(row, 4, "折扣量", style);
	        createCell(row, 5, "折扣單位", style);
	        createCell(row, 6, "創建日期", style);
	        createCell(row, 7, "起始日期", style);
	        createCell(row, 8, "結束日期", style);
	        createCell(row, 9, "優惠代碼", style);
	        createCell(row, 10, "能否同時套用", style);
	        createCell(row, 11, "最小購買數量", style);
	        createCell(row, 12, "最大折扣金額", style);
	        createCell(row, 13, "描述", style);
		}
	}
	
	private void createCell(Row row,int columnCount,Object value ,CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        }else if (value instanceof OrderStatus) {
			cell.setCellValue(((OrderStatus)value).toString());
		}else if (value instanceof DiscountType) {
			cell.setCellValue(((DiscountType)value).toString());
		}
        else {
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
	}
	
	private void writeDataLines() {
		int rowCount = 1;
		
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontHeight(14);
		style.setFont(font);
		
		if(list.get(0) instanceof CartBean) {
			for(E cart: list) {
				Row row =sheet.createRow(rowCount ++);
				int columnCount = 0;
				
				createCell(row, columnCount++, ((CartBean)cart).getCartId(), style);
				createCell(row, columnCount++, ((CartBean)cart).getCustId(), style);
				createCell(row, columnCount++, ((CartBean)cart).getCartTotal(), style);
				createCell(row, columnCount++, ((CartBean)cart).getTradeDate(), style);
				createCell(row, columnCount++, ((CartBean)cart).getOrderState(), style);
				createCell(row, columnCount++, ((CartBean)cart).getShipmentDate(), style);
			}
		}
		
		if(list.get(0) instanceof CartItemBean) {
			for(E cart: list) {
				Row row =sheet.createRow(rowCount ++);
				int columnCount = 0;
				
				createCell(row, columnCount++, ((CartItemBean)cart).getCart().getCartId(), style);
				createCell(row, columnCount++, ((CartItemBean)cart).getProduct().getProdId(), style);
				createCell(row, columnCount++, ((CartItemBean)cart).getPrice(), style);
				createCell(row, columnCount++, ((CartItemBean)cart).getQty(), style);
				createCell(row, columnCount++, ((CartItemBean)cart).getItemTotal(), style);
				
			}
		}
		
        
		if(list.get(0) instanceof CouponBean) {
			for(E cart: list) {
				Row row =sheet.createRow(rowCount ++);
				int columnCount = 0;
				
				createCell(row, columnCount++, ((CouponBean)cart).getCouponId(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getCouponName(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getDiscountType(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getDiscountedClass(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getDiscountValue(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getDiscountUnit(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getCreateDate(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getValidFrom(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getValidUntil(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getCouponCode(), style);
				createCell(row, columnCount++, ((CouponBean)cart).isConcurrency(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getMinimumOrderValue(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getMaximumDiscountAmount(), style);
				createCell(row, columnCount++, ((CouponBean)cart).getDescribe(), style);
			}
		}
	}
	
	public void export(HttpServletResponse response) throws IOException {
		writeHeaderLine();
		writeDataLines();
		
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		
		outputStream.close();
	}
}
