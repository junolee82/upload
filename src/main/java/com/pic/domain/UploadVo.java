package com.pic.domain;

import java.util.Arrays;

public class UploadVo {
	private String[] files;

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return String.format("UploadVo [files=%s]", Arrays.toString(files));
	}

}
