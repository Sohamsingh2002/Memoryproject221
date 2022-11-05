module HitMiss
#(
reg[13:0] tagArrayInCache [7:0] [3:0],
)
(
input reg[11:0] memoryAddress,
output reg hitmiss, 
);
initial begin
  integer tagadd= memoryAddress[11]*16+memoryAddress[10]*8+memoryAddress[9]*4+memoryAddress[8]*2+memoryAddress[7];
  integer indexadd=memoryAddress[6]*4+memoryAddress[5]*2+memoryAddress[4];
  
  reg[13:0] tag1=tagArrayInCache[indexadd][0];
  reg[13:0] tag2=tagArrayInCache[indexadd][1];
  reg[13:0] tag3=tagArrayInCache[indexadd][2];
  reg[13:0] tag4=tagArrayInCache[indexadd][3];
  
  reg tag1v=tag1[13];
  reg tag2v=tag1[13];
  reg tag3v=tag1[13];
  reg tag4v=tag1[13];

  integer tag1t=tag1[11]*16+tag1[10]*8+tag1[9]*4+tag1[8]*2+tag1[7];
  integer tag2t=tag2[11]*16+tag2[10]*8+tag2[9]*4+tag2[8]*2+tag2[7];
  integer tag3t=tag3[11]*16+tag3[10]*8+tag3[9]*4+tag3[8]*2+tag3[7];
  integer tag4t=tag4[11]*16+tag4[10]*8+tag4[9]*4+tag4[8]*2+tag4[7];
  
  if(((tagadd==tag1t)&&(tag1v==1'b1))||((tagadd==tag2t)&&(tag2v==1'b1))||((tagadd==tag3t)&&(tag3v==1'b1))||((tagadd==tag4t)&&(tag4v==1'b1))) begin
  hitmiss=1'b1;
    end
  else begin
  hitmiss=0'b1;
    end
  
  integer hittag;
  if((tagadd==tag1t)&&(tag1v==1'b1))
  begin
  hittag=tag1t
  end
  if((tagadd==tag2t)&&(tag2v==1'b1))
  begin
  hittag=tag2t
  end
  if((tagadd==tag3t)&&(tag3v==1'b1))
  begin
  hittag=tag3t
  end
  if((tagadd==tag4t)&&(tag4v==1'b1))
  begin
  hittag=tag4t
  end
  
       integer empty;
  if(((hitmiss==0'b1))&&((tag1v==0'b1)||(tag2v==0'b1)||(tag3v==0'b1)||(tag4v==0'b1)))
    begin
     if(tag4v==0'b1) begin
         empty=4;
         end
         if(tag3v==0'b1) begin
         empty=3;
         end
         if(tag2v==0'b1) begin
         empty=2;
         end
         if(tag1v==0'b1) begin
         empty=1;
         end
    end
    if(((hitmiss==0'b1))&&((tag1v==1'b1)&&(tag2v==1'b1)&&(tag3v==1'b1)&&(tag4v==1'b1)))
    begin
      //LRU
    end
end