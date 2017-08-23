import { Request, Response } from "express";

export function handler(req: Request, res: Response) {
  if (req.body.message === undefined) {
    // This is an error case, as "message" is required
    res.status(400).send("No message defined!");
  } else {
    // Everything is ok
    console.log(req.body.message);
    res.status(200).end();
  }
}
