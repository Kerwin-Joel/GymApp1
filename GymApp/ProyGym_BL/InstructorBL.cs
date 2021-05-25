using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProGym_BE;
using ProyGym_ADO;
namespace ProyGym_BL
{
   public class InstructorBL
    {
        InstructorADO objInstructorADO = new InstructorADO();

        public Boolean InsertarInstructor(InstructorBE objInstructorBE) {
            return objInstructorADO.InsertarInstructor(objInstructorBE);
        }
    }
}
