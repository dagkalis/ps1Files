urls = File.open("curls").read.split(',').map(&:strip)
for url in urls do  
   command = "powershell \"curl #{url} | select-object -expand StatusCode\""
   status_code = `#{command}`.split("\n").last
   puts status_code
   status_code = status_code.to_i if status_code.present? && status_code.length == 3
   results << [status_code, url]
 end


 results=[];
 for url in urls do  
   command = "powershell \"curl #{url} | select-object -expand StatusCode\""
   status_code = `#{command}`.split("\n").last
   puts status_code
   status_code = status_code.to_i if status_code.present? && status_code.length == 3
   results << [status_code, url]
 end
 results