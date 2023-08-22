`timescale 1ns / 1ps

module masar(
    input [7:0] x,y,output[15:0] result
    );

    ///////calculating the values of a,b,c,d////////
    wire [7:0] a,b,c,d;
    assign a=(~x&~y);
    assign b=(x&y);
    assign c=(~x&y);
    assign d=(x&~y);
    
    //defining partial products
    
    ////////partial products of cxd////////
    wire q07,q06,q05,q04,q03,q02,q01;
    wire q17,q16,q15,q14,q13,q12;
    wire q27,q26,q25,q24,q23;
    wire q37,q36,q35,q34;
    wire q47,q46,q45;
    wire q57,q56;
    wire q67;
    
    ///////partial products of -axb///////
    wire p08,p07,p06,p05,p04,p03,p02,p01,p00;
    wire p17,p16,p15,p14,p13,p12;
    wire p27,p26,p25,p24,p23;
    wire p37,p36,p35,p34;
    wire p47,p46,p45;
    wire p57,p56;
    wire p67;
    wire p87,p86,p85,p84,p83,p82,p81,p80;
    //////all partial products defined//////
    
    /////calculation of partial products starts/////
    ////////////////pps of CxD//////////////////////
    ao22 a1(q01,c[0],d[1],c[1],d[0]);
    ao22 a2(q02,c[0],d[2],c[2],d[0]);
    ao22 a3(q03,c[0],d[3],c[3],d[0]);
    ao22 a4(q04,c[0],d[4],c[4],d[0]);
    ao22 a5(q05,c[0],d[5],c[5],d[0]);
    ao22 a6(q06,c[0],d[6],c[6],d[0]);
    ao22 a7(q07,c[0],d[7],c[7],d[0]);
    
    ao22 a8(q12,c[1],d[2],c[2],d[1]);
    ao22 a9(q13,c[1],d[3],c[3],d[1]);
    ao22 a10(q14,c[1],d[4],c[4],d[1]);
    ao22 a11(q15,c[1],d[5],c[5],d[1]);
    ao22 a12(q16,c[1],d[6],c[6],d[1]);
    ao22 a13(q17,c[1],d[7],c[7],d[1]);
    
    ao22 a14(q23,c[2],d[3],c[3],d[2]);
    ao22 a15(q24,c[2],d[4],c[4],d[2]);
    ao22 a16(q25,c[2],d[5],c[5],d[2]);
    ao22 a17(q26,c[2],d[6],c[6],d[2]);
    ao22 a18(q27,c[2],d[7],c[7],d[2]);
    
    ao22 a19(q34,c[3],d[4],c[4],d[3]);
    ao22 a20(q35,c[3],d[5],c[5],d[3]);
    ao22 a21(q36,c[3],d[6],c[6],d[3]);
    ao22 a22(q37,c[3],d[7],c[7],d[3]);
    
    ao22 a23(q45,c[4],d[5],c[5],d[4]);
    ao22 a24(q46,c[4],d[6],c[6],d[4]);
    ao22 a25(q47,c[4],d[7],c[7],d[4]);
    
    ao22 a26(q56,c[5],d[6],c[6],d[5]);
    ao22 a27(q57,c[5],d[7],c[7],d[5]);
    
    ao22 a28(q67,c[6],d[7],c[7],d[6]);
    
    /////calculation of pps of CxD completed//////
    //////calculation of pps -AxB starts/////////
    
    ///first row of pps that has the modified logic////
    assign p00= (~a[0])&b[0];
    assign p01= ((a[0]&b[0])|(~a[0]&b[1]))|(a[1]&b[0]);
    assign p02= ((a[0]&b[1])|(~a[0]&b[2]))|(a[2]&b[0]);
    assign p03= ((a[0]&b[2])|(~a[0]&b[3]))|(a[3]&b[0]);
    assign p04= ((a[0]&b[3])|(~a[0]&b[4]))|(a[4]&b[0]);
    assign p05= ((a[0]&b[4])|(~a[0]&b[5]))|(a[5]&b[0]);
    assign p06= ((a[0]&b[5])|(~a[0]&b[6]))|(a[6]&b[0]);
    assign p07= ((a[0]&b[6])|(~a[0]&b[7]))|(a[7]&b[0]);
    assign p08= ((a[0]&b[7]));
    
    ////next rows that are caculated by a022 gates////
    ao22 b1(p12,a[1],b[2],a[2],b[1]);
    ao22 b2(p13,a[1],b[3],a[3],b[1]);
    ao22 b3(p14,a[1],b[4],a[4],b[1]);
    ao22 b4(p15,a[1],b[5],a[5],b[1]);
    ao22 b5(p16,a[1],b[6],a[6],b[1]);
    ao22 b6(p17,a[1],b[7],a[7],b[1]);
    
    ao22 b7(p23,a[2],b[3],a[3],b[2]);
    ao22 b8(p24,a[2],b[4],a[4],b[2]);
    ao22 b9(p25,a[2],b[5],a[5],b[2]);
    ao22 b10(p26,a[2],b[6],a[6],b[2]);
    ao22 b11(p27,a[2],b[7],a[7],b[2]);
    
    ao22 b12(p34,a[3],b[4],a[4],b[3]);
    ao22 b13(p35,a[3],b[5],a[5],b[3]);
    ao22 b14(p36,a[3],b[6],a[6],b[3]);
    ao22 b15(p37,a[3],b[7],a[7],b[3]);
    
    ao22 b16(p45,a[4],b[5],a[5],b[4]);
    ao22 b17(p46,a[4],b[6],a[6],b[4]);
    ao22 b18(p47,a[4],b[7],a[7],b[4]);
    
    ao22 b19(p56,a[5],b[6],a[6],b[5]);
    ao22 b20(p57,a[5],b[7],a[7],b[5]);
    
    ao22 b21(p67,a[6],b[7],a[7],b[6]);
    
    assign {p87,p86,p85,p84,p83,p82,p81,p80}=b;
    ///////calculation of pps of -AxB completed///////
    
    ///////calculation of partial sum and carry of (CxD + B.2^n) starts//////
    wire [15:0] psumq;
    wire [15:0] pcarryq;
    assign psumq[0]=0;
    assign psumq[1]=q01;
    assign psumq[2]=q02;  
    assign pcarryq[0]=0;
    assign pcarryq[1]=0;
    assign pcarryq[2]=0;
    assign pcarryq[3]=0;
    
    wire cx1,cx2,cx3,cx4,cx5,cx6,cx7,cx8;
    ha h1(psumq[3],pcarryq[4],q03,q12);
    ha h2(psumq[4],pcarryq[5],q04,q13);
    fa f1(psumq[5],pcarryq[6],q05,q14,q23);
    fa f2(psumq[6],pcarryq[7],q06,q15,q24);
    comp42 c1(psumq[7],pcarryq[8],cx1,q07,q16,q25,q34,0);
    comp42 c2(psumq[8],pcarryq[9],cx2,q17,q26,q35,p80,cx1);
    comp42 c3(psumq[9],pcarryq[10],cx3,q27,q36,q45,p81,cx2);
    comp42 c4(psumq[10],pcarryq[11],cx4,q37,q46,p82,0,cx3);
    comp42 c5(psumq[11],pcarryq[12],cx5,q47,q56,p83,0,cx4);
    comp42 c6(psumq[12],pcarryq[13],cx6,q57,p84,0,0,cx5);
    comp42 c7(psumq[13],pcarryq[14],cx7,q67,p85,0,0,cx6);
    
    assign psumq[14]=p86;
    assign psumq[15]=p87;
    assign pcarryq[15]=0;
  
    /////////calculation of partial sum and carry of CxD completed////////
    ////////calculation of partial sum and carry of (-AxB - B.2^n) starts/////
    wire[15:0] psump;
    wire[15:0] pcarryp;
    assign psump[0]=p00;
    assign psump[1]=p01;
    assign psump[2]=p02;
    
    assign pcarryp[0]=0;
    assign pcarryp[1]=0;
    assign pcarryp[2]=0;
    assign pcarryp[3]=0;
    
    wire cxx1,cxx2,cxx3,cxx4,cxx5;
    ha hh1(psump[3],pcarryp[4],p03,p12);
    ha hh2(psump[4],pcarryp[5],p04,p13);
    fa ff1(psump[5],pcarryp[6],p05,p14,p23);
    fa ff2(psump[6],pcarryp[7],p06,p15,p24);
    comp42 cc1(psump[7],pcarryp[8],cxx1,p07,p16,p25,p34,0);
    comp42 cc2(psump[8],pcarryp[9],cxx2,p08,p17,p26,p35,cxx1);
    comp42 cc3(psump[9],pcarryp[10],cxx3,p27,p36,p45,0,cxx2);
    comp42 cc4(psump[10],pcarryp[11],cxx4,p37,p46,0,0,cxx3);
    comp42 cc5(psump[11],pcarryp[12],cxx5,p47,p56,0,0,cxx4);
    
    assign psump[12]=p57;
    assign psump[13]=p67;
    assign psump[14]=0;
    assign psump[15]=0;
    
    assign pcarryp[13]=0;
    assign pcarryp[14]=0;
    assign pcarryp[15]=0;
    ////////calculation of partial sum and carry of (-AxB - B.2^n) completed/////
    ////////last 4:2 compressor stage starts///////////////////
    
    assign result=(~psump)+(~pcarryp)+(psumq)+(pcarryq)+2;
    
    
    
    
    
    
    /////////temporary check assignments//////////////
//    assign out1=psumq;
//    assign out2=pcarryq;
//    assign out3=psump;
//    assign out4=pcarryp;
    
    
    

endmodule
////////////////////////////////////////////////////
