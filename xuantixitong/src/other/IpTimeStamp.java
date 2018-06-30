package other;

import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Random;  
  
public class IpTimeStamp {  
    private SimpleDateFormat sim=null;//������ȡʱ��  
    private String ip=null;  
    public IpTimeStamp(){  
    }  
    public IpTimeStamp(String ip){  
        this.ip=ip;  
    }  
    public String getIpTimeRand(){  
        StringBuffer sbf=new StringBuffer();  
        if(this.ip!=null){  
            String a[]=this.ip.split("\\.");                //���ݵ������ip��ַ������Ҫת��  
            for(int i=0;i<a.length;i++){  
                sbf.append(this.addZero(a[i], 3));            //���ò���ķ�����ÿ��ip������λ���Զ����㵽��λ  
            }  
            sbf.append(this.getTimeStamp());                //��this�������ⲿ�ķ���  
            Random random=new Random();                        //Ҫ���������  
            for(int i=0;i<3;i++){                            //������λ�����  
                sbf.append(random.nextInt(10));                //ÿλ�������������10  
            }  
        }  
        return sbf.toString();  
    }  
    @SuppressWarnings("unused")  
    private String getDate(){                                //����������ʱ���ʵ��  
        this.sim=new SimpleDateFormat("yyyy-mm-dd hh:mm:ss.SSS");  
        return this.sim.format(new Date());  
    }  
    private String getTimeStamp(){                            //����ʱ���  
        this.sim=new SimpleDateFormat("yyyymmddhhmmssSSS");  
        return this.sim.format(new Date());  
    }  
    private String addZero(String str,int len){                //�Զ�����ķ���������Ϊָ�����ַ����ͳ���  
        StringBuffer s=new StringBuffer();  
        s.append(str);  
        while(s.length()<len){  
            s.insert(0,"0");                                //�����λ���Ͻ��в������  
        }  
        return s.toString();  
    }  
      
    
}  
