const modelClass = require ('../model/class.model')

const insertClass = async (req,res) =>{
    console.log("entra");
    try{
     const [result] = await modelClass.insertClass(req.body)
     res.status(200).json(result.insertId)
     console.log(req.body);
    }
    catch(error){ 
        res.status(400).json({fatal:error.message})
    }
}
const subject_id = async (req,res) =>{
    try{
        const {selectedAsignatura} = req.params
        const [result] = await modelClass.subjectId(selectedAsignatura)
        res.status(200).json(result)
    }
    catch(error){ 
        res.status(400).json({fatal:error.message})
    }
}

module.exports = {insertClass, subject_id}