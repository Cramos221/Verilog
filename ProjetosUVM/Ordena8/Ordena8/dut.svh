
module ordena8(
  
    input logic [7:0] a1,b1,c1,d1,e1,f1,g1,h1,
    output logic [7:0] num1, num2, num3,num4,num5, num6, num7, num8 );
    
    logic [7:0] v1,v2,v3,v4,v5,v6,v7,v8;
    
    
    ordena4 inst1(a1,b1,c1,d1,v1,v2,v3,v4);
    ordena4 inst2(e1, f1, g1, h1,v5,v6,v7,v8);
    
    ordena4 inst3(v1,v2,v5,v6,num1,num2,num3,num4);
    ordena4 inst4(v3,v4,v7,v8,num5,num6,num7,num8);
    
  endmodule
  
  module ordena4(input logic [7:0]a,b,c,d, output logic [7:0]num1,num2,num3,num4);
    
    always@(*)
      begin
        if(a<b && b<c && c<d)
      begin
      num1<=a;
      num2<=b;
      num3<=c;
      num4<=d;
      end
        else if(a<b && b<d && d<c)
          begin
            
             num1<=a;
             num2<=b;
             num3<=d;
             num4<=c;          
          end
        else if( a<c && c<b && b<d )
            begin
             num1<=a;
             num2<=c;
             num3<=b;
             num4<=d;            
            end
        else if ( a<c && c<d && d<b )
           begin
             num1<=a;
             num2<=c;
             num3<=d;
             num4<=b;             
           end
        else if ( a<d && d<b && b<c )
            begin
             num1<=a;
             num2<=d;
             num3<=b;
             num4<=c;             
            end
        else if ( a<d  && d<c && c<b )
           begin
             num1<=a;
             num2<=d;
             num3<=c;
             num4<=b;  
           end
        else if( b<a && a<c && c<d )
           begin
             num1<=b;
             num2<=a;
             num3<=c;
             num4<=d; 
           end
           
        else if ( b<a && a<d && d<c )
          begin
             num1<=b;
             num2<=a;
             num3<=d;
             num4<=c; 
          end
        else if ( b<c && c<a && a<=d )
            begin
             num1<=b;
             num2<=c;
             num3<=a;
             num4<=d;
            end
        else if ( b<c && c<d && d<a )
          begin
             num1<=b;
             num2<=c;
             num3<=d;
             num4<=a;
          end
        else if ( b<d && d<a && a<c )
             begin
             num1<=b;
             num2<=d;
             num3<=a;
             num4<=c;
             end
        else if ( b<d && d<c && c<a )
             begin
             num1<=b;
             num2<=d;
             num3<=c;
             num4<=a;
      end
        
        else if ( c<a && a<d && d<b )
             begin
             num1<=c;
             num2<=a;
             num3<=d;
             num4<=b;
      end
        
      end
    
  endmodule