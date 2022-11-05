module LRU(
 
   input reg hitmiss,
   input reg[13:0] tagArrayInCache [7:0] [3:0];
   input reg[2:0] set,
   input reg[4:0] tag,
   output reg[4:0] tagout,
 

);

integer counter[7:0][3:0][100:0];
int missmaxcount=-1;
for(integer i=0;i<=3;i=i+1)
begin
   if(tagArrayInCache[set][i]==tag && hitmiss==1'b1)
   begin
      counter[set][i]=0;
   end
   else begin
      counter[set][i]=counter[set][i]+1;
      
   end
   if(hitmiss=1'b0)
   begin
     counter[set][i]=counter[set][i]+1;
     if(missmaxcount<counterr[set][i])
     begin
     missmaxcount=counter[set][i];
     tagout=tag[set][i];
     end



   end



end










endmodule

