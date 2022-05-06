const express = require('express')
const actions = require('../methods/actions')  // having all our actions
const router = express.Router()
const multer = require('multer') ;
const mongoose = require ('mongoose');


// for image
const storage = multer.diskStorage({
    destination: function(req, file, cb) {
      cb(null, './uploads/');
    },
    filename: function(req, file, cb) {
      cb(null, new Date().toISOString().replace(/:/g, '-') + file.originalname);
  
    }
  
  });
  
  const fileFilter = (req, file, cb) => {
    //to reject or accept an incoming file
    // reject a file
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
      cb(null, true);//accept the file
    } else {
      cb(null, false); // ignore the file
    }
  };
  
  const upload = multer({
    storage: storage,
    limits: {
      fileSize: 1024 * 1024 * 5
    },
    fileFilter: fileFilter
  });
// 
router.get('/', (req, res) => {
    res.send('Hello World')
})

router.get('/dashboard', (req, res) => {
    res.send('Dashboard')
})

//@desc Adding new user
//@route POST /adduser
router.post('/adduser', actions.addNew)

//@desc Authenticate a user
//@route POST /authenticate
router.post('/authenticate', actions.authenticate)

//@desc Get info on a user
//@route GET /getinfo
router.get('/getinfo', actions.getinfo)

router.post('/updateOne', upload.single('userImage'),actions.update)

router.get('/getall/:name',actions.getUsers)

router.get('/showprofiles', actions.getAllDoc)

router.post('/update/:name', actions.updatewithoutimage)

module.exports = router
