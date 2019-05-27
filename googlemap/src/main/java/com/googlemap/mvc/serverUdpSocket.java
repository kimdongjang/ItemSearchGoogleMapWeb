package com.googlemap.mvc;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class serverUdpSocket {
	public void receiveByteData(byte[] data) {
		// UDP ������ �����ϱ�
        // 1. ������ ��Ʈ�� ��� ���� ����
        try 
        {
        	while(true) {
                DatagramSocket socket = new DatagramSocket(10000);
                
                // 2. ������ �����Ͱ� ����� �� ����Ʈ �迭�� �غ�
                byte[] buf = new byte[512];
                
                // 3. ������ �����Ͱ� ����� �� ��Ŷ�� �� �迭�� �����ؼ� �غ�
                DatagramPacket packet = new DatagramPacket(buf, buf.length);
                System.out.println("���� �����");
                
                // 4. ���Ͽ� �غ��� �� ��Ŷ�� ��� ����
                try 
                {
                    socket.receive(packet);
                    System.out.println("���� �Ϸ�");
                    
                    System.out.println(new String(buf));
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                    socket.close();
                    return;
                }
        	}
        } 
        catch (SocketException e) 
        {
            e.printStackTrace();
            return;
        }    


	}
}
