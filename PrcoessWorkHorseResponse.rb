require 'nokogiri'
require 'net/sftp'
require 'archive/zip'

class PrcoessWorkHorseResponse

    LOCAL_DIR="/Users/chatupu/Downloads/PREQ/".freeze
    FILE_EXTN="*.xml".freeze
    WORKHORSE_TO_SALSIFY="/SalsifyImportToWH".freeze
    ARCHIVE=["/Users/chatupu/Downloads/","PhotoRequests_",".zip"]
   

    ## This method download the files from workhorse server to salsify server.

    def readRemoteXML
        #sftp= Net::SFTP.start('belkuat.workhorsegroup.us', 'BLKUATUSER', :password => '5ada833014a4c092012ed3f8f82aa0c1')
        Net::SFTP.start('belkuat.workhorsegroup.us', 'BLKUATUSER', :password => '5ada833014a4c092012ed3f8f82aa0c1') do |sftp|
             sftp.dir.glob(WORKHORSE_TO_SALSIFY,FILE_EXTN).each do |file|
                #puts file.name
                sftp.download(WORKHORSE_TO_SALSIFY+"/"+file.name, LOCAL_DIR+file.name)
            end 
         end
    end

    ## This method parse the xml on salsify server, placed by "readRemoteXML"  method.
    def parsePhotoRequestReponseXMl
        Dir.glob(LOCAL_DIR+FILE_EXTN).each do |file|
            xml_file = File.read(file)
            doc=Nokogiri::XML.parse(xml_file)
            puts doc

        end
        
    end

    ## This method archive the photo sample request xml files.
    def zipFiles
        time=Time.now.strftime("%Y-%d-%m_%H-%M-%S")
        Archive::Zip.archive(ARCHIVE[0]+ARCHIVE[1]+time+ARCHIVE[2], LOCAL_DIR+".")
        Dir.glob(LOCAL_DIR+FILE_EXTN).each do |file|
           File.delete(file)
        end
    end

    ## This is the main method of the class, it calls all the utility methods of the calls in a sequential order
    def processFiles
       readRemoteXML
       parsePhotoRequestReponseXMl
       zipFiles
    end


end


PrcoessWorkHorseResponse.new.processFiles
