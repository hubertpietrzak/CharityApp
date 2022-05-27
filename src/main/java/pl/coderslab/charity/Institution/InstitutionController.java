package pl.coderslab.charity.Institution;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping("/institution")
public class InstitutionController {

    private final InstitutionRepository institutionRepository;


    public InstitutionController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }
    @GetMapping("/add")
    public String addForm(Model model){
        model.addAttribute("institution", new Institution());
        return "institution/add";
    }

    @PostMapping
    public String institutionAdd(@Valid Institution institution, BindingResult result){
        if(result.hasErrors()){
            return "institution/add";
        }
        institutionRepository.save(institution);
        return "redirect:/institution/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("institution", institutionRepository.findAll());
        return "institution/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable long id, Model model){
        model.addAttribute("institution", institutionRepository.findById(id));
        return "institution/edit";
    }

    @PostMapping("/update")
    public String update(@Valid Institution institution, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("institution", institution);
            return "institution/edit";
        }
        institutionRepository.save(institution);
        return "redirect:/institution/list";
    }

    @RequestMapping("/delete/{id}")
    public String deleteInstitution(@PathVariable long id) {
        institutionRepository.deleteById(id);
        return "redirect:/institution/list";
    }

    @GetMapping("/details/{id}")
    public String details(@PathVariable long id, Model model) {
        Optional<Institution> company = institutionRepository.findById(id);
        company.ifPresent(value -> model.addAttribute("institution", value));
        return "institution/details";
    }


}
