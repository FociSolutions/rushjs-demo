import * as express from 'express';

import { MESSAGE, sampleFunction } from "@demo-rushjs/sample-package";

const app = express.default();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => { 

  const samplePackageFunctionCall =  sampleFunction();
  res.send(`${MESSAGE} - ${samplePackageFunctionCall}, TypeScript Express App!`);

});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});