package com.zdy.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	
	

	
	/**
	 * 1.重命名上传文件
	 * 		保留原来的扩展名
	 * 		通过UUID构建新的文件名
	 * 2.确定文件上传路径
	 * 3.创建文件目录
	 * 4.创建文件本身
	 * 5.调用Multipart的transferTo方法进行上传

	 */
	
	/**
	 * 
	 * @param uploadFile
	 * @param request
	 * @param folder		文件夹名字
	 * @param successPage	返回地址页面
	 * @return
	 * @throws IOException
	 */
	public static String upload(MultipartFile uploadFile,HttpServletRequest request,String folder,String successPage) throws IOException {
		
		String originalFilename = uploadFile.getOriginalFilename();
		
		//test.jpg
		String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
		
		//通过UUID生成一个新的文件名
		String fileName = UUID.randomUUID().toString() + extension;
		
		//确定上传目录, web
		String path = request.getServletContext().getRealPath(folder);
		//映射一个文件对象
		File file = new File(path, fileName);
		System.out.println("路径:"+path);//打印看一下
		System.out.println("文件名:"+fileName);//打印看一下
		//判读父目录是否存在
		File parentFile = file.getParentFile();
		
		if(!parentFile.exists()) {
			parentFile.mkdirs();
		}
		//创建文件本身, 在磁盘上创建文件(0kb)
		file.createNewFile();
		
		//向文件写入数据
		uploadFile.transferTo(file);
		

		return successPage;
	}
}


