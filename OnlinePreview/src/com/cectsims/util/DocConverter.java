package com.cectsims.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;


/**
 * doc docx格式转换 
 */
public class DocConverter {
	private static final int environment = 1;// 环境 1：Windows 2：Linux
	private String fileString;// (只涉及PDF2swf路径问题)
	private String outputPath = "";// 输入路径 ，如果不设置就输出在默认 的位置
	private String fileName;
	private File pdfFile;
	private File swfFile;
	private File docFile;

	public DocConverter(String fileString) {
		ini(fileString);
		System.out.println("文件路径"+fileString);
	}

	/**
	 * * 重新设置file
	 * 
	 * @param fileString
	 *            32.
	 */
	public void setFile(String fileString) {
		ini(fileString);
	}

	/**
	 *  * 初始化 
	 * 
	 * @param fileString
	 *           
	 */
	private void ini(String fileString) {
		this.fileString = fileString;
		fileName = fileString.substring(0, fileString.lastIndexOf("."));
		docFile = new File(fileString);
		pdfFile = new File(fileName+ ".pdf");
		swfFile = new File(fileName+ ".swf");
	}

	/**
	 *  转为PDF 
	 * 
	 * @param file
	 *       
	 */
	private void doc2pdf() throws Exception {
		if (docFile.exists()) {
			if (!pdfFile.exists()) {
				OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
				try {
					connection.connect();
					DocumentConverter converter = new OpenOfficeDocumentConverter(
							connection);
					converter.convert(docFile, pdfFile);
					// close the connection
					connection.disconnect();
					System.out.println("****pdf转换成功，PDF输出： "+ pdfFile.getPath() + "****");
				} catch (java.net.ConnectException e) {
					e.printStackTrace();
					System.out.println("****swf转换器异常，openoffice 服务未启动！****");
					throw e;
				} catch (com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e) {
					e.printStackTrace();
					System.out.println("****swf转换器异常，读取转换文件 失败****");
					throw e;
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			} else {
				System.out.println("****已经转换为pdf，不需要再进行转化 ****");
			}
		} else {
			System.out.println("****swf转换器异常，需要转换的文档不存在， 无法转换****");
		}
	}

	/** * 转换成 swf */
	@SuppressWarnings("unused")
	private void pdf2swf() throws Exception {
		Runtime r = Runtime.getRuntime();
		if (!swfFile.exists()) {
			if (pdfFile.exists()) {
				if (environment == 1) {// windows环境处理
					try {
						Process p = r.exec("D:/Program/swfttools/pdf2swf.exe "+ pdfFile.getPath() + " -o "+ swfFile.getPath() + " -T 9");
						 System.out.print(loadStream(p.getInputStream()));
						 System.err.print(loadStream(p.getErrorStream()));
						 System.out.print(loadStream(p.getInputStream()));
						 System.err.println("****swf转换成功，文件输出： "+swfFile.getPath() + "****");
						if (pdfFile.exists()){
							pdfFile.delete();
						}
					} catch (IOException e) {
						e.printStackTrace();
						throw e;
					}
				} else if (environment == 2) {// linux环境处理
					try {
						Process p = r.exec("pdf2swf" + pdfFile.getPath()+ " -o " + swfFile.getPath() + " -T 9");
					     System.out.print(loadStream(p.getInputStream()));
						 System.err.print(loadStream(p.getErrorStream()));
						 System.err.println("****swf转换成功，文件输出： "+ swfFile.getPath() + "****");
						if (pdfFile.exists()) {
							pdfFile.delete();
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				}
			} else {
				System.out.println("****pdf不存在,无法转换****");
			}
		} else {
			System.out.println("****swf已经存在不需要转换****");
		}
	}

	static String loadStream(InputStream in) throws IOException {
		int ptr = 0;
		in = new BufferedInputStream(in);
		StringBuffer buffer = new StringBuffer();
		while ((ptr = in.read()) != -1) {
			buffer.append((char) ptr);
		}
		return buffer.toString();
	}

	/**
	 * * 转换主方法
	 */
	@SuppressWarnings("unused")
	public boolean conver() {
		if (swfFile.exists()) {
			System.out.println("****swf转换器开始工作，该文件已经转换为 swf****");
			return true;
		}
		if (environment == 1) {
			System.out.println("****swf转换器开始工作，当前设置运行环境 windows****");
		} else {
			System.out.println("****swf转换器开始工作，当前设置运行环境 linux****");
		}
		try {
			doc2pdf();
			pdf2swf();
		} catch (Exception e) {
			  e.printStackTrace();
			  return false;
		}
		System.out.println("文件存在吗？"+swfFile);
		if (swfFile.exists()) {
			System.out.println("存在");
			return true;
		} else {
			System.out.println("不存在");
			return false;
		}
	}

	/**
	 *返回文件路径      
	 * @param     
	 */
	public String getswfPath(){
		if (this.swfFile.exists()){
			String tempString = swfFile.getPath();
			tempString = tempString.replaceAll("\\\\", "/");
			System.out.println("最后文件路径为"+tempString);
			return tempString;
		} else {
			return "文件不存在";
		}
	}

	/**
	 * 设置输出路径
	 * 
	 * @param outputPath
	 */
	public void setOutputPath(String outputPath){
		this.outputPath = outputPath;
		if (!outputPath.equals("")) {
			String realName = fileName.substring(fileName.lastIndexOf("/"),
					fileName.lastIndexOf("."));
			if (outputPath.charAt(outputPath.length()) == '/') {
				swfFile = new File(outputPath + realName + ".swf");
			} else {
				swfFile = new File(outputPath + realName + ".swf");
			}
		}
	}
}

