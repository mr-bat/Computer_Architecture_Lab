// build a cache module
module CACHE
  (
    clk,
    rst,
    cache_read,
    cache_write,
    address,
    cache_readdata,
    cache_writedata
  );

  parameter data_lenght = 65536; // 2 ^ 16
  parameter data_width = 32;
  parameter cache_lenght = 16;
  localparam cache_width = data_width + ($clog2(data_lenght) - $clog2(cache_lenght)) + 1;

  input clk;
  input rst;
  input cache_read;
  input cache_write;
  input [$clog2(data_lenght)-1:0]address;
  input [data_width-1:0]cache_writedata;
  output [data_width-1:0]cache_readdata;

  reg need_sram_for_read;
  reg need_sram_for_write;
  reg [data_width-1:0]cache_readdata;
  reg [cache_width-1:0] cache[cache_lenght-1:0];
  wire [$clog2(cache_lenght)-1:0] cache_address;
  wire valid;
  wire [$clog2(data_lenght) - $clog2(cache_lenght) - 1:0] tag;
  wire [$clog2(data_lenght) - $clog2(cache_lenght) - 1:0] tag_address;
  integer i;

  assign cache_address = address[$clog2(cache_lenght)-1:0];
  assign valid = cache[cache_address][cache_width-1];
  assign tag = cache[cache_address][cache_width-2:data_width];
  assign tag_address = address[$clog2(data_lenght)-1:$clog2(cache_lenght)];

  always @(posedge clk)
  begin
    if(rst)
    begin
      for(i=0; i<cache_lenght; i=i+1)
      begin
        cache[i] <= {cache_width{1'b0}};
      end
    end
    else
    begin
      if(cache_write)
      begin
        cache[cache_address] <= {1'b1, tag_address, cache_writedata};
        need_sram_for_write <= 1'b1;
      end
      else if(cache_read)
      begin
        if(valid & !(tag ^ tag_address))
        begin
          cache_readdata <= cache[cache_address][data_width-1:0];
        end
        else
        begin
          need_sram_for_read <= 1'b1;
        end
      end
    end
  end

endmodule
