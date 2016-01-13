package com.util;
/**
 * 
 * HTML符号过滤类（将文本中的特殊字符转出来）
 * @author HZW
 *
 */
public final class Filter {

	public Filter(){
		
	}
	public static String escapeHTMLTags( String input ) {

		if( input == null || input.length() == 0 ) {
			return input;
		}
		StringBuffer buf = new StringBuffer();
		char ch = ' ';
		for( int i=0; i<input.length(); i++ ) {
			ch = input.charAt(i);
			if( ch == '<' ) {
				buf.append( "&lt;" );
			}
			else if( ch == '>' ) {
				buf.append( "&gt;" );
			}
			else if(ch=='&'){
				buf.append("&amp;");
			}
			else {
				buf.append( ch );
			}
		}
			return buf.toString();
	}
	
}
