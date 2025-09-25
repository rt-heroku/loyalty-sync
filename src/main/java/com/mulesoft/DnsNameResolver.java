package com.mulesoft;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class DnsNameResolver {

	public static void main(String[] args) {
		System.out.println(DnsNameResolver.getPublicHostname());
	}
	
	public static String getPublicHostname() {
        try {
            // Get the InetAddress object for the local host
            InetAddress localHost = InetAddress.getLocalHost();

            // Retrieve the hostname
            String externalDnsName = localHost.getHostName();

            System.out.println("External DNS Name (Hostname): " + externalDnsName);
            
            return externalDnsName;

        } catch (UnknownHostException e) {
            System.err.println("Could not determine the external DNS name: " + e.getMessage());
            return "";
        }
	}
	
	public static String getHostName(String ipAddress) {
        try {
            InetAddress inetAddress = InetAddress.getByName(ipAddress);
            String hostname = inetAddress.getCanonicalHostName();
            System.out.println("IP Address: " + ipAddress);
            System.out.println("Hostname: " + hostname);
            
            return hostname;
            
        } catch (UnknownHostException e) {
            System.err.println("Could not resolve hostname for IP: " + ipAddress);
            e.printStackTrace();
            return "";
        }
		
	}
	
}
