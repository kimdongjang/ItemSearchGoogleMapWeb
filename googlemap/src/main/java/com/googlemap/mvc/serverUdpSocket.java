package com.googlemap.mvc;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class serverUdpSocket {
	public void receiveByteData(byte[] data) {
		// UDP 데이터 수신하기
        // 1. 수신할 포트를 적어서 소켓 생성
        try 
        {
        	while(true) {
                DatagramSocket socket = new DatagramSocket(10000);
                
                // 2. 수신할 데이터가 저장될 빈 바이트 배열을 준비
                byte[] buf = new byte[512];
                
                // 3. 수신할 데이터가 저장될 빈 패킷을 위 배열과 연결해서 준비
                DatagramPacket packet = new DatagramPacket(buf, buf.length);
                System.out.println("수신 대기중");
                
                // 4. 소켓에 준비한 빈 패킷을 담아 수신
                try 
                {
                    socket.receive(packet);
                    System.out.println("수신 완료");
                    
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
