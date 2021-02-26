var express = require('express');
var db = require('../config');
const router = express.Router();


//Add Demo Details
router.post("/addDemoDetails", (req, res) =>{

    const data=req.body;
    var totalData= data.length;

    var validatedData = [];
    var rejectionData = [];
    if(data.length > 0){
        data.forEach((adata, akey)=>{
            var assetTypeId=adata.assetTypeId;
            var assetCategoryId=adata.assetCategoryId;
            var leaseId=adata.leaseId;
            var locationId=adata.locationId;
            var depotId=adata.depotId;

            let sql = `select * FROM tbl_tank_type where tankTypeName="${assetTypeId}"`;
            let sql1 = `select * FROM tbl_tank_category where categoryName="${assetCategoryId}"`;
            let sql2 = `select * FROM tbl_lease where leaseNumber="${leaseId}"`;
            let sql3 = `select * FROM tbl_location where locationName="${locationId}"`;
            let sql4 = `select * FROM tbl_depot where depotName="${depotId}"`;
            
            db.query(sql, function (error, results) {
                if (error) throw error;          
                db.query(sql1, function (error1, results1) {
                    if (error1) throw error1;  
                    
                    db.query(sql2, function (error2, results2) {
                        if (error2) throw error2;          
                        db.query(sql3, function (error3, results3) {
                            if (error3) throw error3;          
                            db.query(sql4, function (error4, results4) {
                                if (error4) throw error4;    

                                if(results.length>0 && results1.length>0 && results2.length>0 && results3.length>0 && results4.length>0){
                                   
                                    validatedData.push(adata);
                                    
                                }else{
                                    if(results.length==0){
                                        ErrorMessage1="Type is not Available, "
                                    }else{
                                        ErrorMessage1="";
                                    }
                                    if(results1.length==0){
                                        ErrorMessage2="Category is not Available, "
                                    }else{
                                        ErrorMessage2="";
                                    }
                                    if(results2.length==0){
                                        ErrorMessage3="Lease is not Available, "
                                    }else{
                                        ErrorMessage3="";
                                    }
                                    if(results3.length==0){
                                        ErrorMessage4="Location is not Available, "
                                    }else{
                                        ErrorMessage4="";
                                    }
                                    if(results4.length==0){
                                        ErrorMessage5="Depot is not Available, "
                                    }else{
                                        ErrorMessage5="";
                                    }
                                    ErrorMessage="";
                                    adata.ErrorMessage=ErrorMessage.concat(ErrorMessage1, ErrorMessage2, ErrorMessage3, ErrorMessage4, ErrorMessage5)
                                    rejectionData.push(adata);
                                }
                                
                                if ((akey + 1) == data.length) {
                                    var validatedDataLength=validatedData.length;
                                    var rejectionDataLength=rejectionData.length;
                                    res.json({status:1,message: 'All Data has been fetched successfully',totalData:totalData,validatedDataLength:validatedDataLength,rejectionDataLength:rejectionDataLength,validatedData:validatedData,rejectionData:rejectionData}) 
                                }   
                            });     
                        });     
                    }); 
                         
                });    

                

               

               
                
                


            });
            
        })
        
    }
    
    
});




module.exports = router;