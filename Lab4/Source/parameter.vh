`ifndef _parameter_vh_
`define _parameter_vh_

`ifdef Resolution_720
//Horizontal Parameters
parameter Total_Pixels = 1650;
parameter Active_Pixel =1280;
parameter H_Front_P =110;
parameter H_Back_P=220;
parameter H_Sync_W = 40;

//Vertical Parameters
parameter Total_lines = 750;
parameter Active_Line = 720;
parameter V_Front_P =5;
parameter V_Back_P=20;
parameter V_Sync_W = 5;
`else
//Horizontal Parameters
parameter Total_Pixels = 2200;
parameter Active_Pixel =1920;
parameter H_Front_P =88;
parameter H_Back_P=148;
parameter H_Sync_W =44;

//Vertical Parameters
parameter Total_lines = 1125;
parameter Active_Line = 1080;
parameter V_Front_P =4;
parameter V_Back_P=36;
parameter V_Sync_W = 5;
`endif
`endif 