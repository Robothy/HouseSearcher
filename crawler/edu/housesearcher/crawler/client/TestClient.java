package edu.housesearcher.crawler.client;

import java.util.Date;
import java.util.Map.Entry;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.boot.jaxb.hbm.spi.PluralAttributeInfoPrimitiveArrayAdapter;
import org.junit.Test;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class TestClient {

    public static void main(String[] args) {
	TestClient client = new TestClient();
	client.test2017030901();
	System.exit(0);
    }

    public void test2017030901(){
	DBHrefProvider dbHrefProvider = new DBHrefProvider("EntHouse", "HHref");
	while(dbHrefProvider.getIsContinueProvide()){
	    dbHrefProvider.getHrefs(20);
	}
    }
    
    
    public void test(){
	String str ="setSetString";
	System.out.println(str.substring(3));
    }
    
    private void binTree(){
	
    }
    
    @Test
    public void test2017030902(){
	Integer[] array = {3,1,3,4,5,6,7,10,6,13,28,50,31,22};
	
	for(int i=0,k;  i<array.length; i++){
	    k = i;
	    for(int j=i; j<array.length;j++){
		Boolean A = (array[k]&0x01)==1;//k 为奇数
		Boolean B = (array[j]&0x01)==1;//j 为奇数 
		Boolean C = array[k]<array[j]; //k<j
		if((!A&&B)||(A&&B&&C)||(!A&&!B&&!C)) k = j; 
	    }
	    if(k!=i){
		array[k]^=array[i];
		array[i]^=array[k];
		array[k]^=array[i];
	    }
	}
	for(Integer n: array){
	    System.out.print(n+", ");
	}
    }
    
    

}
