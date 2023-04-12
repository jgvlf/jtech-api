import { prisma } from "@/lib/prisma";
import { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
    if (req.method === 'GET') {
        const { cpf } = req.query
        if(cpf != undefined){
            const allClients = await prisma.cliente.findUnique({
                where:{
                    CPF: cpf.toString()
                }
            });
            return res.status(200).json(allClients)
        }
        else{
            return res.status(404).json({"Error 404": "Page not Found"})
        }
    }
}